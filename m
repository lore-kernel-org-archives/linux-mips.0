Received: from zcard307.ca.nortel.com (zcard307.ca.nortel.com [47.129.242.67])
	by zcars04e.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id i2TNdHR13909
	for <linux-mips@linux-mips.org>; Mon, 29 Mar 2004 18:39:17 -0500 (EST)
Message-ID: <4068B3A4.4000204@americasm01.nt.com>
Date: Mon, 29 Mar 2004 18:39:16 -0500
From: "Lijun Chen" <chenli@nortelnetworks.com>
MIME-Version: 1.0
Subject: NMI handling in MIPS64
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <chenli@nortelnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040329233916.PRGEtbeOI-SJVwcCFDGFX-2_lJuuvPiHZUeW7x6EnOU@z>

Hi,

I noticed there is a NMI handler in mips32 kernel tree (arch/mips/kernel/head.S and traps.c).
But there is not a counterpart in mips64. Do we need one?
