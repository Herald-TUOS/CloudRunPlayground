import yaml


class Secrets:
    def __init__(self, secrets_file):
        self.secrets_file = secrets_file
        self.secrets = self.load_secrets()

    def load_secrets(self):
        with open(self.secrets_file, "r") as file:
            return yaml.safe_load(file)

    @staticmethod
    def get_redacted_secrets(secrets):
        return {
            key: (
                "REDACTED"
                if not isinstance(secrets[key], dict)
                else Secrets.get_redacted_secrets(secrets[key])
            )
            for key in secrets
        }
