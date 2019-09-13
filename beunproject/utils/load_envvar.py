import os

from django.core.exceptions import ImproperlyConfigured


def load_envvar(name, value_type=str, default=None):
    """
    Loads environment variable. Able to cast value to integer or bool.
    :param name: name of the environment variable
    :param value_type: type to which this environment variable's value needs to be cast
    :param default: default return value.
    :raises django.core.exceptions.ImproperlyConfigured if the envvar's value is None
    :return:
    """
    envvar_value = os.environ.get(name, default)
    if envvar_value is None:
        raise ImproperlyConfigured("Environment variable {} is not set and is required to run".format(name))

    if value_type == int:
        return int(envvar_value)
    elif value_type == bool:
        return True if envvar_value in ('True', 'true', '1') else False
    else:
        return envvar_value
