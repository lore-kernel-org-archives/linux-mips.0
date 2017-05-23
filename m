Received: from mailapp01.imgtec.com ([195.59.15.196]:1203 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993921AbdEWMgz06cjF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 May 2017 14:36:55 +0200
Date: Tue, 23 May 2017 13:36:09 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/4] MIPS16e2 ASE support
Message-ID: <alpine.DEB.2.00.1705180145220.2590@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170523123609.EIKzl36RKNRQXaWS7-DVJhiTBiJwu_x6S9uz56JZygQ@z>

Ralf,

 This patch series adds MIPS16e2 ASE support as per the architecture 
specification[1].  Included there's feature identification, reporting and 
necessary instruction emulation.  These patches have been checked with 
interAptiv MR2 hardware to verify that new MIPS16e2 functions operate 
correctly and with 74Kf hardware to verify that no regression has been 
casued with original MIPS16e support.  See individual descriptions for the 
details of each change made.

 Please queue for the next rc cycle.

References:

[1] "MIPS32 Architecture for Programmers: MIPS16e2 Application-Specific
    Extension Technical Reference Manual", Imagination Technologies
    Ltd., Document Number: MD01172, Revision 01.00, April 26, 2016

  Maciej
