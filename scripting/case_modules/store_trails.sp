public void StoreTrailOnPluginStart()
{
	Case_RegisterModule("store.trail", false, TrailOpened);
}

public void TrailOpened(Jatekos jatekos, char[] trail)
{
	char authid[20];
	jatekos.GetAuthId(AuthId_Steam2, authid, sizeof(authid));
	if (StrContains(authid, "STEAM_") != -1) strcopy(authid, sizeof(authid), authid[8]);

	char Query[1024];
	Format(Query, sizeof(Query), "SELECT id FROM store_players WHERE authid = '%s'", authid);

	DataPack things = new DataPack();
	things.WriteString("trail");
	things.WriteString(trail)

	SQL_TQuery(g_DB, GiveStoreItemForSteamId, Query, things);
}