Received: from oola.is.scarlet.be ([193.74.71.23]:57732 "EHLO
	oola.is.scarlet.be") by ftp.linux-mips.org with ESMTP
	id S20039494AbWLKSKz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 11 Dec 2006 18:10:55 +0000
Date: Mon, 11 Dec 2006 19:10:53 +0100
Message-ID: <JA4FU5$15B25B9E0AEC49C3D47C4ABD5469CF70@scarlet.be>
Subject: Re:hwo to improve a video decoder program's timeslice
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
From: "Philippe De Swert" <philippedeswert@scarlet.be>
Return-Path: <philippedeswert@scarlet.be>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "zzh.hust" <zzh.hust@gmail.com>
Cc: linux-mips <linux-mips@linux-mips.org>
Message-ID: <20061211181053.Z3_XjZECIPmylNIIGB5vvwYZgS6rAC9AI6JbCgLW_48@z>

Hi,

>  i have a video decoder program run as aplication
> and i now have change the HZ from 1000 to 100, set the decoder program
> priority as 99.

Seems you are mixing things here... The HZ change will just change the
interval of the timer tick. For some more explanations about this, look here :
http://kerneltrap.org/node/464

> if i want to the video decoder program to get more time to run, is
> there any other way to improve it ?

Maybe using nice? Try "man nice" in a terminal on your Linux box to get more
explanations about this.

Cheers,

Philippe---
Scarlet ONE -  Combine ADSL with unlimited fixed phone and save 400 euros
http://www.scarlet.be
