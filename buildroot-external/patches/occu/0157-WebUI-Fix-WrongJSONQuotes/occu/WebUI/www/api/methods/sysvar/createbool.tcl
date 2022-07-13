##
# SysVar.createBool
# Erzeugt eine Systemvariable vom Typ Boolean.
#
# Parameter:
#   name: [string] Name der betreffenden Systemvariablen.
#   init_val: [bool] Initialer Status
#   internal: [integer]  Variable sichtbar / Variable intern
#   chnID: [integer] ID des Kanals, an dem die Variable gebunden werden soll. Wenn an kein Kanal gebunden werden soll, ist -1 zu �bergeben
# R�ckgabewert: [string]
#   Objekt der Systemvariablen mit Name, ID, Wert.
##

set script {
  if (chnID != -1) {
   object channel = dom.GetObject(chnID);
  }

  object oSysVars = dom.GetObject( ID_SYSTEM_VARIABLES );
  object sv = dom.CreateObject(OT_VARDP);

  sv.ValueType( ivtBinary );
  sv.ValueSubType( istBool );
  sv.Name(name);
  sv.ValueName0("false");
  sv.ValueName1("true");
  sv.State(init_val);

  if((internal == "true") || (internal == 1)) {
    sv.Internal(true);
  } else {
    sv.Internal(false);
  }

  if (channel) {
    sv.Channel(chnID);
    channel.DPs().Add(sv.ID());
  }

  oSysVars.Add(sv.ID());

  Write('{"name":"'#sv.Name()#'","id":"'#sv.ID()#'","value":"'#sv.Value()#'" }');
  }

jsonrpc_response [hmscript $script args]

