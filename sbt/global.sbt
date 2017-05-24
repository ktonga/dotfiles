import com.dscleaver.sbt.SbtQuickFix.QuickFixKeys
import org.ensime.EnsimeCoursierKeys._
import org.ensime.EnsimeKeys._

QuickFixKeys.vimExecutable := "nvr"

QuickFixKeys.vimEnableServer := sys.env.contains("NVIM_LISTEN_ADDRESS") || sys.props.contains("sbtquickfix.vim.servername")

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.9.3" % "test" cross CrossVersion.full

sourceGenerators in Test += Def.task {
  val file = (sourceManaged in Test).value / "amm.scala"
  IO.write(file, """object amm extends App { ammonite.Main().run() }""")
  Seq(file)
}.taskValue

ensimeIgnoreMissingDirectories in ThisBuild := true

