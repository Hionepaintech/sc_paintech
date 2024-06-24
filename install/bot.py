import os
import logging
import requests
from datetime import datetime, timedelta
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Application, CommandHandler, CallbackQueryHandler, ContextTypes

# Set up logging
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger(__name__)

# Your bot token
TOKEN = '6439511942:AAGjzHz3sA3gcUiLbHdLipC5JjwMUUdpUMg'

# Your GitHub token and repository info
GITHUB_TOKEN = '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'
GITHUB_USERNAME = 'Hionepaintech'
GITHUB_REPO = 'Licensing-'
GITHUB_FILE_PATH = 'main/ipmini'

# Read the content of ipmini file from GitHub
def read_github_file():
    logger.info("Reading GitHub file...")
    url = f'https://raw.githubusercontent.com/{GITHUB_USERNAME}/{GITHUB_REPO}/{GITHUB_FILE_PATH}'
    response = requests.get(url)
    if response.status_code == 200:
        content = response.text
        logger.info("Successfully read GitHub file.")
        return content
    else:
        logger.error(f"Failed to read GitHub file. Status code: {response.status_code}")
        return ''

# Write the content back to ipmini file on GitHub
def write_github_file(content):
    logger.info("Writing to GitHub file...")
    url = f'https://api.github.com/repos/{GITHUB_USERNAME}/{GITHUB_REPO}/contents/{GITHUB_FILE_PATH}'
    headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/vnd.github.v3+json'
    }
    message = {
        'message': 'Update ipmini',
        'content': content.encode('utf-8').decode('latin1'),  # Encode content to base64
        'sha': get_github_sha()
    }
    response = requests.put(url, json=message, headers=headers)
    success = response.status_code == 200
    if success:
        logger.info("Successfully wrote to GitHub file.")
    else:
        logger.error(f"Failed to write to GitHub file. Status code: {response.status_code}")
    return success

# Get the sha of the current ipmini file from GitHub
def get_github_sha():
    logger.info("Getting SHA of GitHub file...")
    url = f'https://api.github.com/repos/{GITHUB_USERNAME}/{GITHUB_REPO}/contents/{GITHUB_FILE_PATH}'
    headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/vnd.github.v3+json'
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        file_info = response.json()
        logger.info("Successfully got SHA of GitHub file.")
        return file_info['sha']
    else:
        logger.error(f"Failed to get SHA of GitHub file. Status code: {response.status_code}")
        return ''

# Add IP to GitHub function
async def add_ip_to_github(user, exp_date, ip_vps):
    logger.info(f"Adding IP to GitHub: {ip_vps} for user {user} expiring on {exp_date}")
    content = read_github_file().strip()
    
    # Format the new entry
    new_entry = f'### {user} {exp_date} {ip_vps}\n'

    # Append the new entry to the content
    content += new_entry

    # Write the updated content back to GitHub
    success = write_github_file(content)
    if success:
        logger.info("Successfully added IP to GitHub.")
        return True
    else:
        logger.error("Failed to add IP to GitHub.")
        return False

# Start command
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text('Hi! This Is bot @paintechvpn, Use /addip to add your Ip Vps for install script.')

# Add IP command
async def addip(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    # Ask for client name
    await update.message.reply_text('Input Client:')

    # Wait for client name input
    client_name_handler = Application.handler()
    client_name_handler
    client_name = await client_name_handler(context)
    

    # Ask for expiration date
    await update.message.reply_text('Input Expired Day (e.g., 30):')

    # Wait for expiration date input
    expiration_date_handler = Application.handler()
    expiration_date = await expiration_date_handler(context)

    # Ask for IP address
    await update.message.reply_text('Input IP:')

    # Wait for IP address input
    ip_handler = Application.handler()
    ip_address = await ip_handler(context)

    # Add IP to GitHub
    success = await add_ip_to_github(client_name, expiration_date, ip_address)

    if success:
        await update.message.reply_text('Ok done..')
    else:
        await update.message.reply_text('Failed to add IP to GitHub.')

# Callback query handler for confirmation button
async def button(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    query = update.callback_query
    await query.answer()

    if query.data == 'add_ip_confirm':
        user = 'Client'  # Replace with actual client name
        exp_date = (datetime.now() + timedelta(days=30)).strftime('%Y-%m-%d')  # Expiration date is 30 days from now
        ip_vps = '104.26.6.171'  # Replace with actual IPv4
        success, message = await add_ip_to_github(user, exp_date, ip_vps)
        if success:
            await query.edit_message_text(text=f'Successfully added IP {ip_vps} to GitHub.')
        else:
            await query.edit_message_text(text=f'Failed to add IP {ip_vps} to GitHub. Reason: {message}')

def main():
    # Create the Application and pass it your bot's token.
    application = Application.builder().token(TOKEN).build()
    
    # Register command handlers
    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("addip", addip))
    application.add_handler(CallbackQueryHandler(button))

    # Start the Bot
    application.run_polling()

if __name__ == '__main__':
    main()
