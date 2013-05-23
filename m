Received: from relay1.mentorg.com ([192.94.38.131]:62560 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6819780Ab3EWQyjco2M5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 May 2013 18:54:39 +0200
Date: Thu, 23 May 2013 17:54:24 +0100
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: [PATCH] MIPS: Trap exception handling fixes
In-Reply-To: <alpine.DEB.1.10.1305231656020.26443@tp.orcam.me.uk>
Message-ID: <alpine.DEB.1.10.1305231744460.26443@tp.orcam.me.uk>
References: <alpine.DEB.1.10.1305230253140.26443@tp.orcam.me.uk> <20130523155009.GA5598@linux-mips.org> <alpine.DEB.1.10.1305231656020.26443@tp.orcam.me.uk>
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
Message-ID: <20130523165424.VHsVsnHtCMQOohU6n-_cuayITrf8FpzNJJzd893lSnU@z>

On Thu, 23 May 2013, Maciej W. Rozycki wrote:

> It looks to me do_bp would benefit from some polishing too.

 To make myself more clear here -- there are two microMIPS BREAK encodings 
of which do_bp assumes (without checking!) the 32-bit one, that is 
actually unlikely to be ever present in compiler-generated code (so how 
was this change validated?), and also the MIPS16 path is special-cased 
(makes a separate call to do_trap_or_bp), which I find error-prone in 
long-term maintenance.

  Maciej
