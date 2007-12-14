Received: from sj-iport-3-in.cisco.com ([171.71.176.72]:29036 "EHLO
	sj-iport-3.cisco.com") by ftp.linux-mips.org with ESMTP
	id S28576271AbXLNUYs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 14 Dec 2007 20:24:48 +0000
Received: from sj-core-5.cisco.com (sj-core-5.cisco.com [171.71.177.238])
	by sj-dkim-2.cisco.com (8.12.11/8.12.11) with ESMTP id lBEKNaAa000615
	for <linux-mips@linux-mips.org>; Fri, 14 Dec 2007 12:23:36 -0800
Received: from xbh-rtp-211.amer.cisco.com (xbh-rtp-211.cisco.com [64.102.31.102])
	by sj-core-5.cisco.com (8.12.10/8.12.6) with ESMTP id lBEKNJ1A000136
	for <linux-mips@linux-mips.org>; Fri, 14 Dec 2007 20:23:36 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Slow transfer for loopback
Date: Fri, 14 Dec 2007 15:23:26 -0500
Message-ID: <0590495B8B6352449CE2CE5E8AAE67F15B4588@xmb-rtp-204.amer.cisco.com>
In-Reply-To: <e6480a290706142014jedbe846g5594f2b546d88796@mail.gmail.com>
References: <e6480a290706142014jedbe846g5594f2b546d88796@mail.gmail.com>
From: "Ratin Rahman (mratin)" <mratin@cisco.com>
Return-Path: <mratin@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20071214202326.jvWf5BBPTcRmlEFdmoqQPgbamQfdYjsWPwQzMErfmR0@z>

Hello All, I am using Mipsel linux 2.6.10 kernel on IDT 79RC32H434 chip
which has integrated Ethernet MAC (100mbps). I am transfering  UDP/RTP
data (30 kbyte for an I frame, 2/3 kb for a p frame, splitted into 
1480 bytes of RTP packets) over the loopback address from one
application to another application. 
I am seeing accumulated delay in receiving the data. Anybody else
experienced similar problem? 

Ratin  
