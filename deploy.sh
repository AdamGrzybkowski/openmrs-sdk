#!/usr/bin/env bash
mvn -B release:prepare -Dusername=$GITusername -Dpassword=$GITpassword
mvn release:perform