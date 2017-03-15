import com.dscleaver.sbt.SbtQuickFix.QuickFixKeys
import org.ensime.EnsimeCoursierKeys._
import org.ensime.EnsimeKeys._

QuickFixKeys.vimExecutable := "nvr"

QuickFixKeys.vimEnableServer := sys.env.contains("NVIM_LISTEN_ADDRESS") || sys.props.contains("sbtquickfix.vim.servername")

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.2" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

ensimeIgnoreMissingDirectories in ThisBuild := true

ensimeServerVersion in ThisBuild := "2.0.0-SNAPSHOT"

