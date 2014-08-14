Received: from mailapp01.imgtec.com ([195.59.15.196]:30427 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6901545AbaHNPJey8VJr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 Aug 2014 17:09:34 +0200
Message-ID: <53ECD126.7090103@imgtec.com>
Date: Thu, 14 Aug 2014 16:09:26 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: Bug tracking system
References: <20140814145558.GA17477@linux-mips.org>
In-Reply-To: <20140814145558.GA17477@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20140814150926.rJMXcXN_YbSaiUwQLQHUyBqaAb21mSjmlqwmEnIhos8@z>

On 14/08/14 15:55, Ralf Baechle wrote:
> While I'm tinkering with the system - linux-mips.org still has no
> bug tracking system to track bugs and so issues get forgotten also the
> only system we have to track feature requests and other to-do items
> currently is the to do page in the wiki.  But the wiki isn't the best
> medium for this purpose.  So should we install something like bugzilla -
> which I personally never liked - or other tracking system?  Suggestions?

If bugzilla is to be used, would it make sense to use the kernel.org
bugzilla which already has a MIPS category, rather than setting up a new
one?

https://bugzilla.kernel.org/buglist.cgi?product=Platform%20Specific%2FHardware&component=MIPS&resolution=---

Cheers
James
