import com.dscleaver.sbt.SbtQuickFix.QuickFixKeys

QuickFixKeys.vimExecutable := "nvr"

QuickFixKeys.vimEnableServer := sys.env.contains("NVIM_LISTEN_ADDRESS") || sys.props.contains("sbtquickfix.vim.servername")

libraryDependencies += "com.lihaoyi" % "ammonite" % "COMMIT-f6a1903" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""
