@echo off
rem  Run POSIX and Windows snapshots and inspection

rem  Copyright 2008 Beman Dawes

rem  Distributed under the Boost Software License, Version 1.0.
rem  See http://www.boost.org/LICENSE_1_0.txt

rem  Must be run in a directory devoted to boost release snapshots

echo Using %BOOST_TRUNK% as boost trunk
time /t
pushd %BOOST_TRUNK%
echo Running svn cleanup on %BOOST_TRUNK%
svn --non-interactive --trust-server-cert cleanup
echo Running svn update on %BOOST_TRUNK%
svn --non-interactive --trust-server-cert up
popd
call %BOOST_TRUNK%\tools\release\snapshot_download_docs.bat
time /t
call %BOOST_TRUNK%\tools\release\snapshot_posix.bat
time /t
call %BOOST_TRUNK%\tools\release\snapshot_windows.bat
time /t
call %BOOST_TRUNK%\tools\release\snapshot_inspection.bat
time /t
