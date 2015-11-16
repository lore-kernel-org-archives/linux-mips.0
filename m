Received: from mailapp01.imgtec.com ([195.59.15.196]:32447 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011673AbbKPOeR0YxPR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Nov 2015 15:34:17 +0100
Date: Mon, 16 Nov 2015 14:34:09 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [RFC PATCH 0/4] MIPS: IEEE Std 754 NaN interlinking support
Message-ID: <alpine.DEB.2.00.1511161358211.7097@tp.orcam.me.uk>
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
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, Daniel Sanders <Daniel.Sanders@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20151116143409.waM5hReeMC0ibAovkhdFbqvCSg5B0QgIFL6g8v6b_dM@z>

Hi,

 This implements the kernel part of IEEE Std 754 NaN interlinking support, 
as per "MIPS ABI Extension for IEEE Std 754 Non-Compliant Interlinking" 
<https://dmz-portal.mips.com/wiki/MIPS_ABI_-_NaN_Interlinking>.

 Four patches are included: a pair of preparatory changes, a generic one 
to allow ports to provide their own auxiliary vector's AT_FLAGS entry 
initialiser and one factoring out pieces of FP context maintenance code, 
respectively, and then a pair of actual changes, implementing the NaN 
interlinking feature proper and a prctl(2) interface to switch the 
compliance mode dynamically respectively.

 These patches rely on 2008-NaN support, recently posted, having been 
applied first.

 At this point this is a request for comments only rather than an actual 
patch submission for inclusion, as consensus about the specification has 
to be reached first.  All feedback is welcome on the implementation and 
I'll be happy to address any questions, comments or concerns.

  Maciej
