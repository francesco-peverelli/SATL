//import sbt.complete._
//import sbt.complete.DefaultParsers._
//import sys.process._

organization := "polimi.it"
version := "1.0"
name := "spatial_templates"
scalaVersion := "2.12.12"

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.4" cross CrossVersion.full)
// See README.md for license details.

libraryDependencies ++= Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.5.4",
  "edu.berkeley.cs" %% "chiseltest" % "0.5.4",
  "edu.berkeley.cs" %% "rocketchip" % "1.2.+")
scalacOptions := Seq("-deprecation", "-unchecked", "-Xsource:2.11", "-language:reflectiveCalls")

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases"),
  Resolver.mavenLocal)
