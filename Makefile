# Variables
BACKEND_DIR=alpr-backend
FRONTEND_DIR=smart-alpr-frontend
DOCKER_COMPOSE=docker-compose

# Pull repositories (if not already cloned)
pull:
	git clone git@github.com:deanfirdianza/alpr-backend.git
	git clone git@github.com:deanfirdianza/smart-alpr-setup-buddy-09.git

# Build and start the services using Docker Compose
up:
	$(DOCKER_COMPOSE) up --build

# Stop the services
down:
	$(DOCKER_COMPOSE) down

# Logs from the containers
logs:
	$(DOCKER_COMPOSE) logs -f

# Rebuild and restart the services
restart:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up --build

# Backend-only service
backend:
	$(DOCKER_COMPOSE) up backend

# Frontend-only service
frontend:
	$(DOCKER_COMPOSE) up frontend

# Run database migration (assuming you have alembic or another migration tool)
migrate:
	$(DOCKER_COMPOSE) exec backend alembic upgrade head

# Clean up all containers
clean:
	$(DOCKER_COMPOSE) down --volumes --rmi all

# Open backend shell
shell-backend:
	$(DOCKER_COMPOSE) exec backend sh

# Open frontend shell
shell-frontend:
	$(DOCKER_COMPOSE) exec frontend sh