from config_handler import Config


if __name__ == "__main__":
    config = Config("configs/config.yaml")
    print(config.config)