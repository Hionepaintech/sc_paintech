import os
import logging
import requests
from datetime import datetime, timedelta
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Updater, CommandHandler, CallbackQueryHandler, CallbackContext

# Set up logging
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levellevel)s - %(message)s',
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
def add_ip_to_github(user, exp_date, ip_vps):
    logger.info(f"Adding IP to GitHub: {ip_vps} for user {user} expiring on {exp_date}")
    content = read_github_file().strip()
    now = datetime.now().strftime('%Y-%m-%d')
    
    # Check if the IP entry already exists
    if f'### {user} {exp_date} {ip_vps}' in content:
        logger.warning("IP entry already exists.")
        return False, "IP entry already exists."

    # Format the new entry
    new_entry = f'### {user} {exp_date} {ip_vps}\n'

    # Append the new entry to the content
    content += new_entry

    # Write the updated content back to GitHub
    success = write_github_file(content)
    if success:
        logger.info("Successfully added IP to GitHub.")
        return True, "Successfully added IP to GitHub."
    else:
        logger.error("Failed to add IP to GitHub.")
        return False, "Failed to add IP to GitHub."

# Start command
def start(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Hi! Use /addip to add your server IP to GitHub.')

# Add IP command
def addip(update: Update, context: CallbackContext) -> None:
    keyboard = [
        [
            InlineKeyboardButton("Confirm", callback_data='add_ip_confirm')
        ]
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    update.message.reply_text(
        'Tambahkan IP vps untuk install script\n'
        'Nama : Client\n'
        'Expired Day : 30 hari\n'
        'IP vps : 104.26.6.171',  # Example IP, replace with actual IP
        reply_markup=reply_markup
    )

# Callback query handler for confirmation button
def button(update: Update, context: CallbackContext) -> None:
    query = update.callback_query
    query.answer()

    if query.data == 'add_ip_confirm':
        user = 'Client'  # Replace with actual client name
        exp_date = (datetime.now() + timedelta(days=30)).strftime('%Y-%m-%d')  # Expiration date is 30 days from now
        ip_vps = '104.26.6.171'  # Replace with actual IPv4
        success, message = add_ip_to_github(user, exp_date, ip_vps)
        if success:
            query.edit_message_text(text=f'Successfully added IP {ip_vps} to GitHub.')
        else:
            query.edit_message_text(text=f'Failed to add IP {ip_vps} to GitHub. Reason: {message}')

def main():
    # Create the Updater and pass it your bot's token.
    updater = Updater(TOKEN)
    
    # Get the dispatcher to register handlers
    dispatcher = updater.dispatcher

    # Register command handlers
    dispatcher.add_handler(CommandHandler("start", start))
    dispatcher.add_handler(CommandHandler("addip", addip))
    dispatcher.add_handler(CallbackQueryHandler(button))

    # Start the Bot
    updater.start_polling()

    # Run the bot until you press Ctrl-C or the process receives SIGINT, SIGTERM or SIGABRT
    updater.idle()

if __name__ == '__main__':
    main()
        
