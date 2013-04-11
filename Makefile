# Program:	IMAP Toolkit Makefile
#
# Author:	Mark Crispin
#		Networks and Distributed Computing
#		Computing & Communications
#		University of Washington
#		Administration Building, AG-44
#		Seattle, WA  98195
#		Internet: MRC@CAC.Washington.EDU
#
# Date:		7 December 1989
# Last Edited:	2 July 2001
#
# The IMAP toolkit provided in this Distribution is
# Copyright 2001 University of Washington.
#
# The full text of our legal notices is contained in the file called
# CPYRIGHT, included with this Distribution.


# Normal command to build IMAP toolkit:
#  make <port> [EXTRAAUTHENTICATORS=xxx] [EXTRADRIVERS=xxx] [EXTRACFLAGS=xxx]
#	       [PASSWDTYPE=xxx] [SSLTYPE=xxx]


# Port name.  These refer to the *standard* compiler on the given system.
# This means, for example, that the hpx port is for HP's compiler and not for
# a non-standard compiler such as gcc.
#
# If you are using gcc and it is not the standard compiler on your system, try
# using an ANSI port that is close to what you have.  For example, if your
# system is SVR4ish, try a32 or lnx; if it's more BSDish, try nxt, mct, or bsi.
#
# The following ports are bundled:
# a32	AIX 3.2 for RS/6000
# a41	AIX 4.1 for RS/6000
# aix	AIX/370 (not RS/6000!!)
# ami	AmigaDOS
# am2	AmigaDOS with a 68020+
# ama	AmigaDOS using AS225R2
# amn	AmigaDOS with a 680x0 using "new" socket library
# aos	AOS for RT
# art	AIX 2.2.1 for RT
# asv	Altos SVR4
# aux	A/UX
# bs3	BSD/i386 3.0 and higher
# bsd	generic BSD 4.3 (as in ancient 1980s version)
# bsf	FreeBSD
# bsi	BSD/i386
# bso	OpenBSD (yes, yet another one...)
# cvx	Convex
# cyg	Cygwin
# d-g	Data General DG/UX prior to 5.4 (d41 port no longer exists)
# d54	Data General DG/UX 5.4
# do4	Apollo Domain/OS sr10.4
# dpx	Bull DPX/2 B.O.S.
# drs	ICL DRS/NX
# dyn	Dynix
# epx	EP/IX
# gas	GCC Altos SVR4
# gh9   GCC HP-UX 9.x
# ghp	GCC HP-UX 10.x
# ghs	GCC HP-UX 10.x with Trusted Computer Base
# go5	GCC 2.7.1 (95q4 from Skunkware _not_ 98q2!) SCO Open Server 5.0.x
# gsc	GCC Santa Cruz Operation
# gsg	GCC SGI
# gso	GCC Solaris
# gsu	GCC SUN-OS
# gul	GCC RISC Ultrix (DEC-5000)
# hpp	HP-UX 9.x (see gh9)
# hpx	HP-UX 10.x (see ghp, ghs, hxd, and shp)
# hxd	HP-UX 10.x with DCE security (see shp)
# isc	Interactive Systems
# lnx	Linux with traditional passwords and crypt() in the C library
#	 (see lnp, sl4, sl5, and slx)
# lnp	Linux with Pluggable Authentication Modules (PAM)
# lyn	LynxOS
# mct	MachTen
# mnt	Atari ST Mint (not MacMint)
# neb	NetBSD/FreeBSD
# nec	NEC UX
# nto	QNX Neutrine RTP
# nxt	NEXTSTEP
# nx3	NEXTSTEP 3.x
# osf	OSF/1 (see sos, os4)
# os4	OSF/1 (Digital UNIX) 4
# osx	Mac OS X
# ptx	PTX
# pyr	Pyramid
# qnx	QNX 4
# s40	SUN-OS 4.0 (*not* Solaris)
# sc5	SCO Open Server 5.0.x (see go5)
# sco	Santa Cruz Operation (see sc5, go5)
# shp	HP-UX with Trusted Computer Base
# sgi	Silicon Graphics IRIX
# sg6	Silicon Graphics IRIX 6.5
# sl4	Linux using -lshadow to get the crypt() function
# sl5	Linux with shadow passwords, no extra libraries
# slx	Linux using -lcrypt to get the crypt() function
# snx	Siemens Nixdorf SININX or Reliant UNIX
# sol	Solaris (won't work unless "ucbcc" works -- use gso instead)
# sos	OSF/1 with SecureWare
# ssn	SUN-OS with shadow password security
# sun	SUN-OS 4.1 or better (*not* Solaris) (see ssn)
# sv2	SVR2 on AT&T PC-7300 (incomplete port)
# sv4	generic SVR4
# ult	RISC Ultrix (DEC-5000)
# uw2	UnixWare SVR4.2
# vul	VAX Ultrix
# vu2	VAX Ultrix 2.3 (e.g. for VAXstation-2000 or similar old version)


# Extra authenticators (e.g. OTP, Kerberos, etc.).  Adds linkage for
# auth_xxx.c and executes Makefile.xxx, where xxx is the name of the
# authenticator.  Some authenticators are only available from third parties.
#
# The following extra authenticators are bundled:
# gss	Kerberos V

EXTRAAUTHENTICATORS=


# Additional mailbox drivers.  Add linkage for xxxdriver.  Some drivers are
# only available from third parties.
#
# The following extra drivers are bundled:
# mbox	if file "mbox" exists on the home directory, automatically moves mail
#	 from the spool directory to "mbox" and uses "mbox" as INBOX.

EXTRADRIVERS=mbox


# Plaintext password type.  Defines how plaintext password authentication is
# done on this system.
#
# The following plaintext login types are bundled:
# afs	AFS authentication database
# dce	DCE authentication database
# gss	Kerberos V
# nul	plaintext authentication never permitted
# pam	PAM authentication (note: for Linux, you should use the "lnp" port
#	 instead of setting this...also, you may have to modify PAMLDFLAGS
#	 in the imap-[]/src/osdep/unix/Makefile
# pmb	PAM authentication for broken implementations such as Solaris.
#	 you may have to modify PAMLDFLAGS
# std	system standard (typically passwd file), determined by port
# two	try alternative (defined by CHECKPWALT), then std

PASSWDTYPE=std


# SSL type.  Defines whether or not SSL support is on this system
#
# The following SSL types are bundled:
# none	no SSL support
# unix	SSL support using OpenSSL
# nopwd	SSL support using OpenSSL, and plaintext authentication permitted only
#	in SSL/TLS sessions
# sco	link SSL before other libraries (for SCO systems)
# unix.nopwd	same as nopwd
# sco.nopwd	same as nopwd, plaintext authentication in SSL/TLS only

SSLTYPE=none


# The following extra compilation flags are defined.  None of these flags are
# recommended.  If you use these, include them in the EXTRACFLAGS.
#
# -DDISABLE_POP_PROXY
#	By default, the ipop[23]d servers offer POP->IMAP proxy access,
#	which allow a POP client to access mail on an IMAP server by using the
#	POP server as a go-between.  Setting this option disables this
#	facility.
#
# -DOLDFILESUFFIX=\"xxx\"
#	Change the default suffix appended to the backup .newsrc file from
#	"old".
#
# -DSTRICT_RFC822_TIMEZONES
#	Disable recognition of the non-standard UTC (0000), MET (+0100),
#	EET (+0200), JST (+0900), ADT (-0300), AST (-0400), YDT (-0800),
#	YST (-0900), and HST (-1000) symbolic timezones.
#
# -DBRITISH_SUMMER_TIME
#	Enables recognition of non-standard symbolic timezone BST as +0100.
#
# -DBERING_STANDARD_TIME
#	Enables recognition of non-standard symbolic timezone BST as -1100.
#
# -DNEWFOUNDLAND_STANDARD_TIME
#	Enables recognition of non-standard symbolic timezone NST as -0330.
#
# -DNOME_STANDARD_TIME
#	Enables recognition of non-standard symbolic timezone NST as -1100.
#
# -DSAMOA_STANDARD_TIME
#	Enables recognition of non-standard symbolic timezone SST as -1100.
#				
# -DY4KBUGFIX
#	Turn on the Y4K bugfix (yes, that's year 4000).  It isn't well-known,
#	but century years evenly divisible by 4000 are *not* leap years in the
#	Gregorian calendar.  A lot of "Y2K compilant" software does not know
#	about this rule.  Remember to turn this on sometime in the next 2000
#	years.
#
# -DUSEORTHODOXCALENDAR
#	Use the more accurate Eastern Orthodox calendar instead of the
#	Gregorian calendar.  The century years which are leap years happen
#	at alternating 400 and 500 year intervals without shifts every 4000
#	years.  The Orthodox and Gregorian calendars diverge by 1 day for
#	gradually-increasing intervals, starting at 2800-2900, and becoming
#	permanent at 48,300.

EXTRACFLAGS=


# Extra linker flags (additional/alternative libraries, etc.)

EXTRALDFLAGS=


# Special make flags (e.g. to override make environment variables)

#SPECIALS=
EXTRASPECIALS=
# *** TEMPORARY FOR PINE BUILD ***
GSSDIR=/usr/local
SPECIALS=GSSDIR=$(GSSDIR)
# *** TEMPORARY FOR PINE BUILD ***


# Normal commands

CAT=cat
CD=cd
LN=ln -s
MAKE=make
MKDIR=mkdir
BUILDTYPE=rebuild
RM=rm -rf
SH=sh
SYSTEM=unix
TOOLS=tools
TOUCH=touch


# Primary build command

BUILD=$(MAKE) build EXTRACFLAGS='$(EXTRACFLAGS)'\
 EXTRALDFLAGS='$(EXTRALDFLAGS)'\
 EXTRADRIVERS='$(EXTRADRIVERS)'\
 EXTRAAUTHENTICATORS='$(EXTRAAUTHENTICATORS)'\
 PASSWDTYPE=$(PASSWDTYPE) SSLTYPE=$(SSLTYPE)\
 EXTRASPECIALS='$(EXTRASPECIALS)'


# Make the IMAP Toolkit

all:	c-client rebuild bundled

c-client:
	@echo Not processed yet.  In a first-time build, you must specify
	@echo the system type so that the sources are properly processed.
	@false


# Note on SCO you may have to set LN to "ln".

a32 a41 aix bs3 bsf bsi bso cyg d-g d54 do4 drs epx gas gh9 ghp ghs go5 gsc gsg gso gsu gul hpp hpx lnp lyn mct mnt neb nec nto nxt nx3 osf os4 osx ptx qnx sc5 sco sgi sg6 shp sl4 sl5 slx snx sol sos uw2: an
	$(BUILD) BUILDTYPE=$@

# If you use sv4, you may find that it works to move it to use the an process.
# If so, you probably will want to delete the "-Dconst=" from the sv4 CFLAGS in
# the c-client Makefile.

aos art asv aux bsd cvx dpx dyn isc pyr s40 sv4 ult vul vu2: ua
	$(BUILD) BUILDTYPE=$@

# Linux shadow password support doesn't build on traditional systems, but most
# Linux systems are shadow these days.

lnx:	lnxnul an
	$(BUILD) BUILDTYPE=$@

lnxnul:
	@sh -c '(test $(PASSWDTYPE) = nul) || make lnxok'

lnxok:
	@echo You are building for traditional Linux.  Most modern Linux
	@echo systems require that you build using make slx.  Do you want
	@echo to continue this build?  Type y or n please:
	@sh -c 'read x; case "$$x" in y) exit 0;; *) exit 1;; esac'
	@echo OK, I will remember that you really want to build for
	@echo traditional Linux.  You will not see this message again.
	@echo If you discover that you can not log in to the POP and IMAP
	@echo servers, then do the following commands:
	@echo % rm lnxok
	@echo % make clean
	@echo % make slx
	@echo If slx does not work, try sl4 or sl5.  Be sure to do a
	@echo make clean between each try!
	@touch lnxok


# SUN-OS makes you load libdl by hand...

ssn sun: suntools ua
	$(BUILD) BUILDTYPE=$@

suntools:
	$(CD) tools;$(MAKE) LDFLAGS=-ldl


# SVR2 doesn't have symbolic links (at least my SVR2 system doesn't)

sv2:
	$(MAKE) ua LN=ln
	$(BUILD) BUILDTYPE=$@ LN=ln


# Pine port names, not distinguished in c-client

bs2:	an
	$(BUILD) BUILDTYPE=bsi

pt1:	an
	$(BUILD) BUILDTYPE=ptx


# Compatibility

hxd:	# Gotta do this one the hard way
	$(MAKE) hpx PASSWDTYPE=dce

# Amiga

ami am2 ama amn:
	$(MAKE) an LN=cp SYSTEM=amiga
	$(BUILD) BUILDTYPE=$@ LN=cp


# Courtesy entries for Microsoft systems

nt:
	nmake /nologo /f makefile.nt

ntk:
	nmake /nologo /f makefile.ntk

w2k:
	nmake /nologo /f makefile.w2k

wce:
	nmake /nologo /f makefile.wce


# C compiler types

an ua:
	@echo Applying $@ process to sources...
	$(TOOLS)/$@ "$(LN)" src/c-client c-client
	$(TOOLS)/$@ "$(LN)" src/ansilib c-client
	$(TOOLS)/$@ "$(LN)" src/charset c-client
	$(TOOLS)/$@ "$(LN)" src/osdep/$(SYSTEM) c-client
	$(TOOLS)/$@ "$(LN)" src/mtest mtest
	$(TOOLS)/$@ "$(LN)" src/ipopd ipopd
	$(TOOLS)/$@ "$(LN)" src/imapd imapd
	$(LN) $(TOOLS)/$@ .

build:	OSTYPE rebuild rebuildclean bundled

OSTYPE:
	@echo Building c-client for $(BUILDTYPE)...
	echo $(SPECIALS) $(EXTRASPECIALS) > c-client/SPECIALS
	$(CD) c-client;$(MAKE) $(BUILDTYPE) EXTRACFLAGS='$(EXTRACFLAGS)'\
	 EXTRALDFLAGS='$(EXTRALDFLAGS)'\
	 EXTRADRIVERS='$(EXTRADRIVERS)'\
	 EXTRAAUTHENTICATORS='$(EXTRAAUTHENTICATORS)'\
	 PASSWDTYPE=$(PASSWDTYPE) SSLTYPE=$(SSLTYPE)\
	 $(SPECIALS) $(EXTRASPECIALS)
	echo $(BUILDTYPE) > OSTYPE
	$(TOUCH) rebuild

rebuild:
	@sh -c '(test $(BUILDTYPE) = rebuild -o $(BUILDTYPE) = `$(CAT) OSTYPE`) || (echo Already built for `$(CAT) OSTYPE` -- you must do \"make clean\" first && exit 1)'
	@echo Rebuilding c-client for `$(CAT) OSTYPE`...
	$(TOUCH) c-client/SPECIALS
	$(CD) c-client;$(MAKE) all CC=`$(CAT) CCTYPE` \
	 CFLAGS="`$(CAT) CFLAGS`" `$(CAT) SPECIALS`

rebuildclean:
	sh -c '$(RM) rebuild || true'

bundled:
	@echo Building bundled tools...
	$(CD) mtest;$(MAKE)
	$(CD) ipopd;$(MAKE)
	$(CD) imapd;$(MAKE)

clean:
	@echo Removing old processed sources and binaries...
	sh -c '$(RM) an ua OSTYPE c-client mtest imapd ipopd || true'
	$(CD) tools;$(MAKE) clean


# A monument to a hack of long ago and far away...
love:
	@echo not war?
