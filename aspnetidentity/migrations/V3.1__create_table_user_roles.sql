create table "UserRoles"
(
    "UserId" NUMBER(19) not null
        constraint "FK_UserRoles_Users_UserId"
            references "Users"
                on delete cascade,
    "RoleId" NUMBER(19) not null
        constraint "FK_UserRoles_Roles_RoleId"
            references "Roles"
                on delete cascade,
    constraint "PK_UserRoles"
        primary key ("UserId", "RoleId")
)
/

create index "IX_UserRoles_RoleId"
    on "UserRoles" ("RoleId")
/

