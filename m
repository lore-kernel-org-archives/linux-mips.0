Reply-To: <a.voropay@vmb-service.ru>
From: "Alexander Voropay" <a.voropay@vmb-service.ru>
Subject: RE: Howto run Linux on ACER PICA 61
Date: Tue, 20 Jul 2004 19:59:52 +0400
Message-ID: <0ab701c46e72$97b49d60$0200000a@ALEC>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <0aa601c46e63$f3ddbef0$0200000a@ALEC>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040720155952.zymaAtEuXj7aWLDAYO5PPwoq4XBrJFKqckj8wCh5GYI@z>

Hi!

>  Unfortunately, the build script does not provide a selection for the
SCSI driver for
>the ACER PICA 

 It seems, this is a typo in Kconfigs... The JAZZ machine name is a
"MACH_JAZZ",
not a  "MIPS_JAZZ"


[root@monitor linux]# find . -name "Kconfig" | xargs grep MIPS_JAZZ
./drivers/net/Kconfig:config MIPS_JAZZ_SONIC
./drivers/net/Kconfig:  depends on NET_ETHERNET && MIPS_JAZZ
./drivers/scsi/Kconfig: depends on MIPS_JAZZ && SCSI
./linux/drivers/net/Kconfig:config MIPS_JAZZ_SONIC
./linux/drivers/net/Kconfig:    depends on NET_ETHERNET && MIPS_JAZZ
./linux/drivers/scsi/Kconfig:   depends on MIPS_JAZZ && SCSI


--
-=AV=-
