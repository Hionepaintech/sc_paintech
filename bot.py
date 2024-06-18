import logging
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ApplicationBuilder, CommandHandler, CallbackContext, CallbackQueryHandler, MessageHandler, filters
import requests
import base64
from datetime import datetime, timedelta

logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

API_TOKEN = '6439511942:AAGjzHz3sA3gcUiLbHdLipC5JjwMUUdpUMg'

GITHUB_USER = 'Hionepaintech'
GITHUB_REPO = 'Licensing-'
GITHUB_FILE_PATH = 'ipmini'
GITHUB_TOKEN = 'ghp_n0v3r5h4r3d3d'
# Pastikan untuk mengganti token di atas dengan token GitHub yang baru

async def start(update: Update, context: CallbackContext) -> None:
    await update.message.reply_text('Hii ini adalah bot @paintechvpn\nSilahkan gunakan /menu untuk cek daftar bot nya.')

async def menu(update: Update, context: CallbackContext) -> None:
    keyboard = [
        [InlineKeyboardButton("Cek Server", url="https://status.isppaintechidn.cloud")],
        [InlineKeyboardButton("Add IP VPS", callback_data='add_ip')]
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    await update.message.reply_text('Daftar Menu:', reply_markup=reply_markup)

async def button(update: Update, context: CallbackContext) -> None:
    query = update.callback_query
    await query.answer()

    if query.data == 'add_ip':
        context.user_data['step'] = 'client'
        await query.edit_message_text(text='Input Client:')

async def handle_message(update: Update, context: CallbackContext) -> None:
    step = context.user_data.get('step')

    if step == 'client':
        context.user_data['client'] = update.message.text
        context.user_data['step'] = 'expired'
        await update.message.reply_text('Input Expired (dalam hari):')
    elif step == 'expired':
        context.user_data['expired'] = update.message.text
        context.user_data['step'] = 'ip'
        await update.message.reply_text('Input IP VPS:')
    elif step == 'ip':
        context.user_data['ip'] = update.message.text
        client = context.user_data['client']
        expired_days = int(context.user_data['expired'])
        ip = context.user_data['ip']
        
        # Hitung tanggal kedaluwarsa
        expired_date = datetime.now() + timedelta(days=expired_days)
        expired_date_str = expired_date.strftime('%Y-%m-%d')
        
        # Tambahkan IP ke GitHub
        success = add_ip_to_github(client, expired_date_str, ip)
        if success:
            await update.message.reply_text('Ok done..')
        else:
            await update.message.reply_text('Gagal memperbarui GitHub.')
        context.user_data.clear()

def add_ip_to_github(client, expired, ip):
    url = f'https://api.github.com/repos/{GITHUB_USER}/{GITHUB_REPO}/contents/{GITHUB_FILE_PATH}'
    headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/vnd.github.v3+json'
    }

    # Dapatkan konten file yang ada di GitHub
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        logger.error(f'Error getting file: {response.status_code} {response.json()}')
        return False

    data = response.json()

    # Decode content from base64
    file_content = base64.b64decode(data['content']).decode('utf-8')

    # Tambahkan data baru ke konten file
    new_content = file_content + f'### {client} {expired} {ip}\n'

    # Encode konten file baru ke base64
    encoded_content = base64.b64encode(new_content.encode('utf-8')).decode('utf-8')

    # Siapkan payload untuk permintaan PUT
    payload = {
        'message': 'Add IP',
        'content': encoded_content,
        'sha': data['sha']
    }

    # Kirim permintaan PUT untuk memperbarui file di GitHub
    update_response = requests.put(url, headers=headers, json=payload)
    if update_response.status_code != 200:
        logger.error(f'Error updating file: {update_response.status_code} {update_response.json()}')
        return False
    else:
        logger.info('File updated successfully')
        return True

def main() -> None:
    application = ApplicationBuilder().token(API_TOKEN).build()

    application.add_handler(CommandHandler('start', start))
    application.add_handler(CommandHandler('menu', menu))
    application.add_handler(CallbackQueryHandler(button))
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))

    application.run_polling()

if __name__ == '__main__':
    main()
        
