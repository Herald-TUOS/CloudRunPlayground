import logging
from datetime import datetime
from config_handler import Config
from secret_handler import Secrets

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)


def log_time_now():
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


if __name__ == "__main__":

    config = Config("configs/config.yaml").config
    secrets = Secrets("configs/secrets.yaml")

    print("Read config file:", config)
    print("Read secrets file:", secrets.get_redacted_secrets(secrets.secrets))

    if config["params"]["log_level"] == "DEBUG":
        logger.debug(f"This is a cloud run {config["params"]["cloud_run_type"]}")
        logger.debug(f"Current time: {log_time_now()}")
    elif config.config["params"]["log_level"] == "INFO":
        logger.debug(f"This is a cloud run {config["params"]["cloud_run_type"]}")
        logger.info(f"Current time: {log_time_now()}")
