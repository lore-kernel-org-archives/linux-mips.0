Received: from smtp1.infineon.com ([217.10.60.22]:3704 "EHLO
	smtp1.infineon.com") by ftp.linux-mips.org with ESMTP
	id S20037961AbWKWGpf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 23 Nov 2006 06:45:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: init cannot spawn shell
Date: Thu, 23 Nov 2006 07:45:25 +0100
Message-ID: <B0956DED3DE3CD47BF0398D4E0ECE59F011B70C9@mucse307.eu.infineon.com>
In-Reply-To: <1164246953.6511.25.camel@sandbar.kenati.com>
From: <Andre.Messerschmidt@infineon.com>
Return-Path: <Andre.Messerschmidt@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ashlesha@kenati.com
Cc: linux-mips@linux-mips.org
Message-ID: <20061123064525.OnBz6Tc2C4yZtY3TqbxSUzMr3-mcBeCYVnK3-HmlRrk@z>

Hi,
 

> I m sure that the endianness is not an issue - everything is big 
> endian.

We had some problem in the past, where the reverse endianess bit was
set, that would result in a crash when the system starts init. Not sure
what bootloader you are using, but maybe it is worth checking the RE bit
in CP0.STATUS, since otherwise your userspace applications will run in
little endian.

Regards
Andre
