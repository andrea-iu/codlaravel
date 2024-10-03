CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    email_verified_at TIMESTAMP(0) NULL,
    password VARCHAR(255) NOT NULL,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);

CREATE TABLE password_resets (
    email VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP(0) NULL
);
CREATE INDEX password_resets_email_index ON password_resets (email);

CREATE TABLE failed_jobs (
    id BIGSERIAL PRIMARY KEY,
    uuid VARCHAR(255) UNIQUE NOT NULL,
    connection TEXT NOT NULL,
    queue TEXT NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at TIMESTAMP(0) NOT NULL
);

CREATE TABLE migrations (
    id BIGSERIAL PRIMARY KEY,
    migration VARCHAR(255) NOT NULL,
    batch INTEGER NOT NULL
);

CREATE TABLE personal_access_tokens (
    id BIGSERIAL PRIMARY KEY,
    tokenable_type VARCHAR(255) NOT NULL,
    tokenable_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    token VARCHAR(64) UNIQUE NOT NULL,
    abilities TEXT NULL,
    last_used_at TIMESTAMP(0) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);
CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON personal_access_tokens (tokenable_type, tokenable_id);

CREATE TABLE sessions (
    id VARCHAR(255) PRIMARY KEY,
    user_id BIGINT NULL,
    ip_address VARCHAR(45) NULL,
    user_agent TEXT NULL,
    payload TEXT NOT NULL,
    last_activity INT NOT NULL
);
