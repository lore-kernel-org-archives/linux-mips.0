Received: from rtp-iport-2.cisco.com ([64.102.122.149]:3452 "EHLO
        rtp-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492343Ab0ECXkL convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 4 May 2010 01:40:11 +0200
Received: from xbh-rcd-202.cisco.com (xbh-rcd-202.cisco.com [72.163.62.201])
        by rcdn-core-4.cisco.com (8.14.3/8.14.3) with ESMTP id o43Ne4p8015600
        for <linux-mips@linux-mips.org>; Mon, 3 May 2010 23:40:04 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: [PATCH] Apply kmap_high_get with MIPS
Date: Mon, 3 May 2010 18:40:04 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400DBBA5E5@XMB-RCD-208.cisco.com>
From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Return-Path: <dediao@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100503234004.QBOT0OWWmG1btdFcrv73tfi0z_kadxZ8GbiwwJmhEO4@z>

Hi all,

The changes mentioned in the link below are intended to apply on MIPS
dma functions.


http://lkml.org/lkml/2009/3/7/137
