import logging
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Updater, CommandHandler, CallbackContext, CallbackQueryHandler, MessageHandler, Filters
import requests

# Konfigurasi logging
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# Token API Telegram
API_TOKEN = '7023411387:AAGIZ-iM60ZfOaNjy-acliJtfElYi3oAibk'

# Detail GitHub
GITHUB_USER = 'Hionepaintech'
GITHUB_REPO = 'Licensing-'
GITHUB_FILE_PATH = 'main/ipmini'
GITHUB_TOKEN = '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'

# Fungsi untuk menangani perintah /start
def start(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Hii ini adalah bot @paintechvpn\nSilahkan gunakan /menu untuk cek daftar bot nya.')

# Fungsi untuk menangani perintah /menu
def menu(update: Update, context: CallbackContext) -> None:
    keyboard = [
        [InlineKeyboardButton("Cek Server", url="https://status.isppaintechidn.cloud")],
        [InlineKeyboardButton("Add IP VPS", callback_data='add_ip')]
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    update.message.reply_text('Daftar Menu:', reply_markup=reply_markup)

# Fungsi untuk menangani callback dari tombol inline
def button(update: Update, context: CallbackContext) -> None:
    query = update.callback_query
    query.answer()

    if query.data == 'add_ip':
        context.user_data['step'] = 'client'
        query.edit_message_text(text='Input Client:')

# Fungsi untuk menangani input dari pengguna
def handle_message(update: Update, context: CallbackContext) -> None:
    step = context.user_data.get('step')

    if step == 'client':
        context.user_data['client'] = update.message.text
        context.user_data['step'] = 'expired'
        update.message.reply_text('Input Expired (dalam hari):')
    elif step == 'expired':
        context.user_data['expired'] = update.message.text
        context.user_data['step'] = 'ip'
        update.message.reply_text('Input IP VPS:')
    elif step == 'ip':
        context.user_data['ip'] = update.message.text
        client = context.user_data['client']
        expired = context.user_data['expired']
        ip = context.user_data['ip']
        add_ip_to_github(client, expired, ip)
        update.message.reply_text('Ok done..')
        context.user_data.clear()

# Fungsi untuk menambahkan IP ke GitHub
def add_ip_to_github(client, expired, ip):
    url = f'https://api.github.com/repos/{GITHUB_USER}/{GITHUB_REPO}/contents/{GITHUB_FILE_PATH}'
    headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/vnd.github.v3+json'
    }
    response = requests.get(url, headers=headers)
    data = response.json()
    content = requests.utils.unquote(data['content'])
    content += f'### {client} {expired} {ip}\n'
    encoded_content = requests.utils.quote(content)
    payload = {
        'message': 'Add IP',
        'content': encoded_content,
        'sha': data['sha']
    }
    requests.put(url, headers=headers, json=payload)

# Fungsi utama
def main() -> None:
    updater = Updater(API_TOKEN)
    dispatcher = updater.dispatcher

    dispatcher.add_handler(CommandHandler('start', start))
    dispatcher.add_handler(CommandHandler('menu', menu))
    dispatcher.add_handler(CallbackQueryHandler(button))
    dispatcher.add_handler(MessageHandler(Filters.text & ~Filters.command, handle_message))

    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()

