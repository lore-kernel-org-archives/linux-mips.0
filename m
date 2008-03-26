Received: from oss.sgi.com ([192.48.170.157]:54696 "EHLO oss.sgi.com")
	by lappi.linux-mips.net with ESMTP id S1100635AbYCZNEj (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 26 Mar 2008 14:04:39 +0100
Received: from p549F5321.dip.t-dialin.net (localhost [127.0.0.1])
	by oss.sgi.com (8.12.11.20060308/8.12.11/SuSE Linux 0.7) with ESMTP id m2QBVULO016060
	for <linux-mips@linux-mips.org>; Wed, 26 Mar 2008 06:03:58 -0700
Received: from mms2.broadcom.com ([216.31.210.18]:18962 "EHLO
	mms2.broadcom.com") by lappi.linux-mips.net with ESMTP
	id S1102827AbYCZFV0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 26 Mar 2008 06:21:26 +0100
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.10.64.221]) by
 mail-irva-10.broadcom.com (Postfix) with ESMTP id A39182B0 for
 <linux-mips@linux-mips.org>; Tue, 25 Mar 2008 22:20:45 -0700 (PDT)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
 [10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
 CFACF20501 for <linux-mips@linux-mips.org>; Tue, 25 Mar 2008 22:20:44
 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: MTD Partitions Permissions at Run Time.
Date: Tue, 25 Mar 2008 22:20:43 -0700
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD0641257D@NT-SJCA-0752.brcm.ad.broadcom.com>
In-Reply-To: <47E7EBFF.6020406@ru.mvista.com>
References: <47E559B6.9010001@ru.mvista.com>
 <47E7EBFF.6020406@ru.mvista.com>
From: "Ramgopal Kota" <rkota@broadcom.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-Path: <rkota@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org

Hi ,

Ours is a embedded product with pre-defined flash partitions say "Boot"
, "Kernel" , "Rootfs" & "ProductData".
The kernel which is in the box (linux 2.6.14)has Boot partition as "RO"
(Read Only). We have a requirement in the field that the boot code
should be upgraded also.
Is there any possibility of changing the partition permissions at
run-time? If so how ? 
Our solution was to create a Kernel image Boot as RW, upgrade the kernel
& reboot. Later change the Boot code.

But we are seeing if we can avoid such situation by remounting the MTD
partition with a RW permission.

Ramgopal Kota
