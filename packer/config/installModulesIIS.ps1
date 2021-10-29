# Instala modulos do IIS

# natives modules
$modulesNatives = @{
    # AnonymousAuthenticationModule = "authanon.dll"
    ApplicationInitializationModule = "warmup.dll"
    BasicAuthenticationModule = "authbas.dll"
    ConfigurationValidationModule = "validcfg.dll"
    # CustomErrorModule = "custerr.dll"
    CustomLoggingModule = "logcust.dll"
    # DefaultDocumentModule = "defdoc.dll"
    # DirectoryListingModule = "dirlist.dll"
    DynamicCompressionModule = "compdyn.dll"
    FailedRequestsTracingModule = "iisfreb.dll"
    # FileCacheModule = "cachfile.dll"
    # HttpCacheModule = "cachhttp.dll"
    # HttpLoggingModule = "loghttp.dll"
    IsapiFilterModule = "filter.dll"
    IsapiModule = "isapi.dll"
    # ProtocolSupportModule = "protsup.dll"
    # RequestFilteringModule = "modrqflt.dll"
    RequestMonitorModule = "iisreqs.dll"
    RewriteModule = "rewrite.dll"
    # StaticCompressionModule = "compstat.dll"
    # StaticFileModule = "static.dll"
    # TokenCacheModule = "cachtokn.dll"
    TracingModule = "iisetw.dll"
    # UriCacheModule = "cachuri.dll"
    UrlAuthorizationModule = "urlauthz.dll"
    WebSocketModule = "iiswsock.dll"
    WindowsAuthenticationModule = "authsspi.dll"
}

foreach ($item in $modulesNatives.GetEnumerator()) {
   $command = "C:\Windows\system32\inetsrv\appcmd.exe install module /name:"+ $item.Name +" /image:%windir%\system32\inetsrv\" + $item.Value
   Invoke-Expression $command
}

C:\Windows\system32\inetsrv\appcmd.exe install module /name:ManagedEngine64 /image:"%windir%\Microsoft.NET\Framework64\v2.0.50727\webengine.dll"
C:\Windows\system32\inetsrv\appcmd.exe install module /name:ManagedEngine /image:"%windir%\Microsoft.NET\Framework\v2.0.50727\webengine.dll"
C:\Windows\system32\inetsrv\appcmd.exe install module /name:ManagedEngineV4.0_32bi /image:"%windir%\Microsoft.NET\Framework\v4.0.30319\webengine4.dll"
C:\Windows\system32\inetsrv\appcmd.exe install module /name:ManagedEngineV4.0_64bit /image:"%windir%\Microsoft.NET\Framework64\v4.0.30319\webengine4.dll"

# managed modules
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"FileAuthorization" /type:"System.Web.Security.FileAuthorizationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"OutputCache" /type:"System.Web.Caching.OutputCacheModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"Session" /type:"System.Web.SessionState.SessionStateModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"WindowsAuthentication" /type:"System.Web.Security.WindowsAuthenticationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"FormsAuthentication" /type:"System.Web.Security.FormsAuthenticationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"DefaultAuthentication" /type:"System.Web.Security.DefaultAuthenticationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"RoleManager" /type:"System.Web.Security.RoleManagerModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"UrlAuthorization" /type:"System.Web.Security.UrlAuthorizationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"AnonymousIdentification" /type:"System.Web.Security.AnonymousIdentificationModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"Profile" /type:"System.Web.Profile.ProfileModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"UrlMappingsModule" /type:"System.Web.UrlMappingsModule" /precondition:"managedHandler"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"UrlRoutingModule-4.0" /type:"System.Web.Routing.UrlRoutingModule" /precondition:"managedHandler,runtimeVersionv4.0"
C:\Windows\system32\inetsrv\appcmd.exe add module /name:"ScriptModule-4.0" /type:"System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" /precondition:"managedHandler,runtimeVersionv4.0"
