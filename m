Received: from mx1.netlogicmicro.com ([12.49.93.86]:1277 "EHLO
        orion5.netlogicmicro.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S1491083Ab1CYPlD convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 25 Mar 2011 16:41:03 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: XLR/XLS drivers?
Date: Fri, 25 Mar 2011 08:41:37 -0700
Message-ID: <9F4F5E1D3FF7D94388F341BE8819BA3D88A83E@orion8.netlogicmicro.com>
References: <20110325145745.GA8483@linux-mips.org>
From: "Jayachandran C" <jayachandranc@netlogicmicro.com>
Return-Path: <jayachandranc@netlogicmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20110325154137.bdRJhNrLVmLwxqJgPABUdnnpAEq2iO_xyQdjk57avVk@z>

Ralf Baechle [mailto:ralf@linux-mips.org] wrote:
 
> What are your plans for merging all the XLR and XLS specific drivers?

The immediate plan is to start with the fast messaging network, USB and then PCI.
The on chip network driver code needs major cleanup and that should be the next
in line.

I have been working on the XLP code meanwhile, and the first cut will be available
in a week or so.

JC.
