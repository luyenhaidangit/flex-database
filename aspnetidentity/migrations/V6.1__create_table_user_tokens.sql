create table "UserTokens"
(
    "UserId"        NUMBER(19)     not null
        constraint "FK_UserTokens_Users_UserId"
            references "Users"
                on delete cascade,
    "LoginProvider" NVARCHAR2(450) not null,
    "Name"          NVARCHAR2(450) not null,
    "Value"         NVARCHAR2(2000),
    constraint "PK_UserTokens"
        primary key ("UserId", "LoginProvider", "Name")
)
/

