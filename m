Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199705281912.MAA06609@neteng.engr.sgi.com>
From: lm@neteng.engr.sgi.com (Larry McVoy)
Subject: Re: hardware independent hinv 
Date: Wed, 28 May 1997 12:12:22 -0700
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ariel Faigon <ariel@sgi.com>
Cc: linux@yon.engr.sgi.com, olson@anchor.engr.sgi.com, scotth@sgi.com, swmgr@swmgr.engr.sgi.com, breyer@swmgr.engr.sgi.com
Message-ID: <19970528191222.Pgkj8up8XGy2Wg2i0mgK70JrIiGZSYCwJhAqorEzon4@z>

: Just forwarding since it sounds someone hopes that Linux/MIPS
: will some day have a HW independent hinv... - Ariel

Here's my first pass at it.  It certainly isn't complete but it is a 
start.  We could evolve Linux' /proc to fully handle this.

#!/usr/bin/perl -w

# Try and emulate SGI's hinv command
# We want to figure out the following:
# CPU type, mhz, memory, busses, floppies, disks, tapes, cdroms, ttys,
# networks, graphics.

# indy ~ hinv
# Iris Audio Processor: version A2 revision 4.1.0
# 1 175 MHZ IP22 Processor
# FPU: MIPS R4000 Floating Point Coprocessor Revision: 0.0
# CPU: MIPS R4400 Processor Chip Revision: 6.0
# On-board serial ports: 2
# On-board bi-directional parallel port
# Data cache size: 16 Kbytes
# Instruction cache size: 16 Kbytes
# Secondary unified instruction/data cache size: 1 Mbyte on Processor 0
# Main memory size: 64 Mbytes
# Vino video: unit 0, revision 0
# Integral ISDN: Basic Rate Interface unit 0, revision 1.0
# XPI FDDI controller: xpi0, firmware version 9601221233, SAS
# Integral Ethernet: ec0, version 1
# Integral SCSI controller 0: Version WD33C93B, revision D
#  Disk drive: unit 2 on SCSI controller 0
#  Disk drive: unit 1 on SCSI controller 0
# Graphics board: Indy 24-bit

# i586 ~ hinv
# Main memory size: 24 Mbytes
# 1 GenuineIntel 586 processor
# 1 16450 serial port
# 2 16550A serial ports
# 1 post-1991 82077 floppy controller
# 1 1.44M floppy drive
# 1 vga+ graphics device
# 1 keyboard
# 2 ethernet interfaces
#   eth0: 3Com 3c595 Vortex 100baseTX
#   eth2: 3c509
# 1 SCSI tape 1 SCSI cdrom 2 SCSI disks
#   QUANTUM  EMPIRE_1080S
#   HP       C3725S
#   ARCHIVE  VIPER 150  21531
#   TOSHIBA  CD-ROM XM-3501TA
# PCI bus devices:
#    SCSI storage controller: NCR 53c810 (rev 2).
#    Ethernet controller: 3Com 3C595 100bTX (rev 0).
#    VGA compatible device: S3 Inc. Vision 964-P (rev 0).
#    IDE interface: Intel 82371 Triton PIIX (rev 2).
#    ISA bridge: Intel 82371 Triton PIIX (rev 2).
#    Host bridge: Intel 82437 (rev 2).

open(FD, "dmesg|") || die "no dmesg";
while (<FD>) {
	@_ = split;
	if (/^Memory:/) {
		$_[1] =~ s|.*/||;
		$_[1] =~ s|k$||;
		$_[1] /= 1024;
		$mem = "Main memory size: $_[1] Mbytes\n";
	} elsif (/^tty/) {
		$ttys{$_[$#_]}++;
	} elsif (/^Floppy/) {
		$floppy{$_[$#_]}++;
	} elsif (/^FDC /) {
		s/.*is a //;
		chop;
		$fdc{$_}++;
	} elsif (/^scsi : detected/) {
		$scsi = $_;
	} elsif (/^eth\d.* at /) {
		s/\s*at .*//;
		push(@eth, $_);
	} 
}
open(FD, "/proc/cpuinfo");
while (<FD>) {
	@_ = split;
	if (/cpu/) {
		$cpu = $_[$#_];
	}
	if (/vendor/) {
		$cpus{"$_[$#_] $cpu"}++;
	}
}
open(FD, "/proc/ioports");
while (<FD>) {
	if (/kbd/ || /keyboard/) {
		$kbd++;
	} elsif (/vga/) {
		@_ = split;
		$graphics{$_[$#_]}++;
	}
}

print $mem if (defined $mem);
foreach $key (keys %cpus) {
	print "$cpus{$key} $key processor";
	print $cpus{$key} > 1 ? "s\n" : "\n";
}
foreach $key (keys %ttys) {
	print "$ttys{$key} $key serial port";
	print $ttys{$key} > 1 ? "s\n" : "\n";
}
foreach $key (keys %fdc) {
	print "$fdc{$key} $key floppy controller";
	print $fdc{$key} > 1 ? "s\n" : "\n";
}
foreach $key (keys %floppy) {
	print "$floppy{$key} $key floppy drive";
	print $floppy{$key} > 1 ? "s\n" : "\n";
}
foreach $key (keys %graphics) {
	print "$graphics{$key} $key graphics device";
	print $graphics{$key} > 1 ? "s\n" : "\n";
}
if (defined $kbd) {
	print "$kbd keyboard";
	print $kbd > 1 ? "s\n" : "\n";
}
if ($#eth > -1) {
	$n = $#eth + 1;
	print "$n ethernet interface";
	print $n > 1 ? "s\n" : "\n";
	foreach $eth (@eth) {
		print "  $eth";
	}
}
if (defined $scsi) {
	$scsi =~ s/.*detected //;
	$scsi =~ s/ total.//;
	print $scsi;
	open(FD, "/proc/scsi/scsi");
	$_ = <FD>;
	while (<FD>) {
		next unless /Vendor/;
		s/.*Vendor:\s*//;
		s/\s*Rev:.*//;
		s/Model:\s*//;
		print "  $_";
	}
}

open(FD, "/proc/pci");
$done = 0;
while (<FD>) {
	if (/^\s*Bus/) {
		if ($done == 0) {
			print "PCI bus devices:\n";
			$done++;
		}
		$_ = <FD>;
		print;
	}
}
