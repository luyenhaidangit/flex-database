INSERT INTO "Users" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount") 
VALUES (1, 'admin', 'ADMIN', 'luyenhaidangit@gmail.com', 'LUYENHAIDANGIT@GMAIL.COM', 1, 'AQAAAAIAAYagAAAAEOz4tb1nW6wxzqhXka7A7CniH/C5C2VUP+qR86SvqgDK1hfTHWtNo/w0WAOkY1Fm8Q==', 'NKFB7ZPVI6BUX5XEZ24RYZIYVFAUPI7G', '7a6d8be7-56fa-46a5-ba8f-6ba9ede03de2', null, 0, 0, null, 1, 0);

INSERT INTO "Roles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") 
VALUES (1, 'Admin', 'ADMIN', 'ddf92f46-bd4b-4a4f-bf1f-4bce0d4b2f17');

INSERT INTO "UserRoles" ("UserId", "RoleId") 
VALUES (1, 1);

COMMIT;
/

-- 07/06/2025: Seed ROLE_REQUESTS
INSERT INTO ROLE_REQUESTS (ID, ENTITY_ID, ACTION, STATUS, REQUESTED_DATA, COMMENTS, MAKER_ID, REQUESTED_DATE, CHECKER_ID, APPROVE_DATE) 
VALUES (3, null, 'CREATE', 'UNA', '{
                  "Code": "ADMIN",
                  "Name": "Administrator",
                  "Description": "Quyền quản trị hệ thống",
                  "IsActive": true
                }', 'Add cho vui', '1', TIMESTAMP '2025-06-07 15:46:41.000000', null, null);

COMMIT;
