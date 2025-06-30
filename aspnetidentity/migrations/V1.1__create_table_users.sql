create table USERS
(
    ID                     VARCHAR2(256 char)                     not null
        primary key,
    USER_NAME              VARCHAR2(256 char)                     not null
        unique,
    NORMALIZED_USER_NAME   VARCHAR2(256 char)                     not null
        unique,
    EMAIL                  VARCHAR2(256 char)                     not null
        unique,
    NORMALIZED_EMAIL       VARCHAR2(256 char)                     not null
        unique,
    EMAIL_CONFIRMED        CHAR         default 'N',
    PASSWORD_HASH          VARCHAR2(256 char)                     not null,
    SECURITY_STAMP         VARCHAR2(256 char),
    CONCURRENCY_STAMP      VARCHAR2(256 char),
    PHONE_NUMBER           VARCHAR2(20 char),
    PHONE_NUMBER_CONFIRMED CHAR         default 'N',
    TWO_FACTOR_ENABLED     CHAR         default 'N',
    MFA_SECRET             VARCHAR2(100 char),
    LOCKOUT_END            TIMESTAMP(6),
    LOCKOUT_ENABLED        CHAR         default 'Y',
    ACCESS_FAILED_COUNT    NUMBER(10)   default 0,
    FULL_NAME              VARCHAR2(200 char),
    CREATED_AT             TIMESTAMP(6) default CURRENT_TIMESTAMP not null,
    LAST_LOGIN             TIMESTAMP(6),
    IS_ACTIVE              CHAR         default 'Y',
    BRANCH_ID              NUMBER(19)
)
/