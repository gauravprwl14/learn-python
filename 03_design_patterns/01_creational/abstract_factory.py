from abc import ABC, abstractmethod
from dataclasses import dataclass
from functools import partial
from typing import Dict, Type


class DatabaseConnection(ABC):
    @abstractmethod
    def connect(self) -> None:
        pass

    @abstractmethod
    def execute(self, query: str) -> None:
        pass

    @abstractmethod
    def close(self) -> None:
        pass


class CacheSystem(ABC):
    @abstractmethod
    def get(self, key: str) -> str:
        pass

    @abstractmethod
    def set(self, key: str, value: str) -> None:
        pass


@dataclass
class SystemConfig:
    env: str
    region: str
    is_production: bool


class InfrastructureFactory(ABC):
    """Abstract Factory for creating infrastructure components"""

    def __init__(self, config: SystemConfig):
        self.config = config

    @abstractmethod
    def create_database(self) -> DatabaseConnection:
        pass

    @abstractmethod
    def create_cache(self) -> CacheSystem:
        pass

    @classmethod
    def get_factory(cls, config: SystemConfig) -> "InfrastructureFactory":
        factories: Dict[str, Type[InfrastructureFactory]] = {
            "development": DevInfrastructureFactory,
            "staging": StagingInfrastructureFactory,
            "production": ProductionInfrastructureFactory,
        }
        return factories[config.env](config)


class ProductionInfrastructureFactory(InfrastructureFactory):
    """Production infrastructure with high availability and monitoring"""

    def create_database(self) -> DatabaseConnection:
        if self.config.region == "eu":
            return HighAvailabilityDatabase(
                replicas=3, monitoring=True, backup_strategy="continuous"
            )
        return StandardDatabase(monitoring=True)

    def create_cache(self) -> CacheSystem:
        return DistributedCache(nodes=5, replication_factor=2)


# Usage Example
def setup_infrastructure(config: SystemConfig):
    factory = InfrastructureFactory.get_factory(config)

    # Create infrastructure components
    db = factory.create_database()
    cache = factory.create_cache()

    # Initialize components with dependency injection
    app = Application(database=db, cache=cache, config=config)

    return app
