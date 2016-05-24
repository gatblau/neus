USE pamm;

CREATE TABLE user (
  id                 BIGINT(20)   NOT NULL AUTO_INCREMENT,
  email              VARCHAR(255) NOT NULL UNIQUE,
  forename           VARCHAR(50),
  surname            VARCHAR(50),
  password           VARCHAR(255),
  job_title          VARCHAR(20),
  base_site          VARCHAR(20),
  phone              VARCHAR(20),
  activation_date    DATE,
  failed_login_count INTEGER      NOT NULL DEFAULT 0,
  last_access        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  role               VARCHAR(10)  NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE project (
  id            BIGINT(20)   NOT NULL AUTO_INCREMENT,
  title         VARCHAR(255) NOT NULL,
  project_code  VARCHAR(20),
  client        VARCHAR(255),
  summary       VARCHAR(255) NOT NULL,
  status        VARCHAR(20),
  PRIMARY KEY (id)
);

CREATE TABLE project_user (
  project_id BIGINT(20)   NOT NULL,
  user_email VARCHAR(255) NOT NULL,
  user_id    BIGINT(20),
  forename   VARCHAR(50),
  surname    VARCHAR(50),
  role       VARCHAR(20),
  PRIMARY KEY (project_id, user_email),
  FOREIGN KEY (project_id) REFERENCES project (id),
  FOREIGN KEY (user_id) REFERENCES user (id)
);