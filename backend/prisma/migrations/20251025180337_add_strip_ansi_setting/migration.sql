-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Bot" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT,
    "prefix" TEXT DEFAULT '@',
    "note" TEXT,
    "owners" TEXT DEFAULT '',
    "sortOrder" INTEGER,
    "stripAnsiFromLogs" TEXT NOT NULL DEFAULT 'off',
    "serverId" INTEGER NOT NULL,
    "proxyHost" TEXT,
    "proxyPort" INTEGER,
    "proxyUsername" TEXT,
    "proxyPassword" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Bot_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "Server" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Bot" ("createdAt", "id", "note", "owners", "password", "prefix", "proxyHost", "proxyPassword", "proxyPort", "proxyUsername", "serverId", "sortOrder", "updatedAt", "username") SELECT "createdAt", "id", "note", "owners", "password", "prefix", "proxyHost", "proxyPassword", "proxyPort", "proxyUsername", "serverId", "sortOrder", "updatedAt", "username" FROM "Bot";
DROP TABLE "Bot";
ALTER TABLE "new_Bot" RENAME TO "Bot";
CREATE UNIQUE INDEX "Bot_username_key" ON "Bot"("username");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
