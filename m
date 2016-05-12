Received: from mailapp01.imgtec.com ([195.59.15.196]:3275 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029239AbcELJSFN7RET (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 May 2016 11:18:05 +0200
Date: Thu, 12 May 2016 10:17:46 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/2] MIPS: ptrace: Fix FCSR handling
Message-ID: <alpine.DEB.2.00.1605120014000.6794@tp.orcam.me.uk>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20160512091746.RVFeAvXkKb59dFY6-Vyw2MKrID8WXMyzNKwVz5vLqno@z>

Hi,

 In the course of reviewing Steven's FCSR patch yesterday I came across a 
regression which I have inadvertently introduced with my FPU handling 
updates last year as well as a missed case not addressed there, both in 
ptrace(2) handling.  These issues are corrected with the two changes 
presented here.  Please apply ASAP and backport as far back as applicable, 
which is 4.0 AFAICT.

 Thank you and apologies for the mess.

  Maciej
