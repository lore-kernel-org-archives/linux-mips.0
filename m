Received: from mailapp01.imgtec.com ([195.59.15.196]:11538 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992535AbcLMLJ0DeXRS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Dec 2016 12:09:26 +0100
Date: Tue, 13 Dec 2016 11:09:05 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [RFC] MIPS: Add cacheinfo support
In-Reply-To: <584F3E9D.9030501@imgtec.com>
Message-ID: <alpine.DEB.2.00.1612131101200.6743@tp.orcam.me.uk>
References: <20161208011626.20885-1-justinpopo6@gmail.com> <5849EC43.2070802@imgtec.com> <CAJx26kW0e-HC0VUTObZ5Or+XjFvE9KmtOToKbFvKYvhE--Vw5A@mail.gmail.com> <584A0281.3040505@imgtec.com> <3004fca6-3688-65bb-7c86-248603482088@gmail.com> <584F0C71.5010004@imgtec.com>
 <6981ff1e-685e-2df7-4b6e-c67c3aa735e7@gmail.com> <584F3E9D.9030501@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Justin Chen <justinpopo6@gmail.com>, linux-mips@linux-mips.org, bcm-kernel-feedback-list@broadcom.com, Justin Chen <justin.chen@broadcom.com>
Message-ID: <20161213110905.FmM4XpsozImwyNcogs-Bb3NLVmWDZJZoZ6L2yB1xfqw@z>

On Tue, 13 Dec 2016, Leonid Yegoshin wrote:

> Well, I prefer the collection of 3 flags:
> 
> flush_required        - or flush to next level is required to force coherency
> between this level and next after update of this level
> invalidate_required   - or invalidate is required to force coherency between
> this level and next after update of next level
> coherent_to_level     - object is coherent with this level (only one domain of
> coherency on this level is assumed)

 A "flush" has always been an ambiguous term -- meaning anything from 
"write-back", through "write-back+invalidate" to "invalidate".  What is 
"flush" is supposed to exactly mean here?  If specifically any of the two 
formers (the latter is obviously the other flag), then I suggest using the 
respective name, or otherwise if it is meant to be generic "do what is 
needed", then perhaps "synchronize" will work, like with the name of the 
SYNCI instruction?

  Maciej
