Received: from relay1.mentorg.com ([192.94.38.131]:57232 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6835061Ab3EWQHoTYp1o (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 May 2013 18:07:44 +0200
Date: Thu, 23 May 2013 17:07:35 +0100
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: [PATCH] MIPS: Trap exception handling fixes
In-Reply-To: <20130523155009.GA5598@linux-mips.org>
Message-ID: <alpine.DEB.1.10.1305231656020.26443@tp.orcam.me.uk>
References: <alpine.DEB.1.10.1305230253140.26443@tp.orcam.me.uk> <20130523155009.GA5598@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
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
Message-ID: <20130523160735.qCxq6B0ZYCL6l1h0sksGK5K1vi-JO7qXulZ-lPPkYSY@z>

On Thu, 23 May 2013, Ralf Baechle wrote:

> Seems that whole bloody patchset was painfully unripe :-(

 Sigh, I meant to at least skim over the patches to review them, but these 
days I can hardly find time for smaller changes even.  This particular 
issue was found in GCC regression testing.  I think at least running the 
GCC and glibc test suites across the three ABIs and both endiannesses each 
to make sure MIPS16/microMIPS support didn't regress standard MIPS support 
was due.  This would have avoided this problem.  It looks to me do_bp 
would benefit from some polishing too.

  Maciej
