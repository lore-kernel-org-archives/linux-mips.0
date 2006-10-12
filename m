Received: from mail95.messagelabs.com ([216.82.241.67]:18330 "HELO
	mail95.messagelabs.com") by ftp.linux-mips.org with SMTP
	id S20038329AbWJLQGE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 12 Oct 2006 17:06:04 +0100
Received: from avgw02c.sony.com.sg (avgw02c [43.68.8.33])
	by inetmg1.sony.com.sg (8.11.7+Sun/8.11.6) with SMTP id k9CG5KQ06678
	for <linux-mips@linux-mips.org>; Fri, 13 Oct 2006 00:05:20 +0800 (SGT)
Received: from sgapxbh04.ap.sony.com ([43.68.15.49])
	by seagw01.sony.com.sg (8.11.6+Sun/8.11.6) with ESMTP id k9CG5Ca12450
	for <linux-mips@linux-mips.org>; Fri, 13 Oct 2006 00:05:12 +0800 (SGT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: KProbes Support for MIPS
Date: Thu, 12 Oct 2006 21:34:40 +0530
Message-ID: <7CC0A4CCB789A841944E316301AD153817FDED@insardxms01.ap.sony.com>
From: "Madhvesh Sulibhavi" <madhvesh.s@ap.sony.com>
Return-Path: <madhvesh.s@ap.sony.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061012160440.nCk8ANdA-TbEdVWrDBXyuezYgGMO4MApZwdTC1rFtdM@z>

Hi All,

The mainline kernel 2.6.16  (and later) had KProbes support
for x86, Alpha and PPC64 architectures. In this patch we provide
an implementation of KProbe for the MIPS arch. It is targetted
at the 2.6.16-24 kernel and tested on the Toshiba TX49 reference
platform. The patch is available in the below CELF wiki page 

http://tree.celinuxforum.org/CelfPubWiki/PatchArchive

The patch can be downloaded from here
http://tree.celinuxforum.org/CelfPubWiki/PatchArchive?action=AttachFile&
do=get&target=kprobes-mips-patches-2.6.16.24.tgz

Please see the documentation for usage and limitations.

Look forward to any feedback.
Thank you

Regards
Madhvesh

=============================
Madhvesh Sulibhavi
Sony India Software Centre
Bangalore
=============================



-------------------------------------------------------------------
This email is confidential and intended only for the use of the individual or entity named above and may contain information that is privileged. If you are not the intended recipient, you are notified that any dissemination, distribution or copying of this email is strictly prohibited. If you have received this email in error, please notify us immediately by return email or telephone and destroy the original message. - This mail is sent via Sony Asia Pacific Mail Gateway.
-------------------------------------------------------------------
