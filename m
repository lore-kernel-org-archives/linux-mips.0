Received: from mailapp01.imgtec.com ([195.59.15.196]:54785 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993215AbcKATFD6cJ1a (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Nov 2016 20:05:03 +0100
Date: Tue, 1 Nov 2016 19:04:48 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: System clock going slow/fast with ntpdate
In-Reply-To: <012925E3-E06F-413D-BBD4-9BF40F0F08A7@lysator.liu.se>
Message-ID: <alpine.DEB.2.00.1611011900260.24498@tp.orcam.me.uk>
References: <20161026081208.M10605@cdot.in> <20161026085306.M18729@cdot.in> <012925E3-E06F-413D-BBD4-9BF40F0F08A7@lysator.liu.se>
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
To: Markus Gothe <nietzsche@lysator.liu.se>
Cc: Deepak Gaur <dgaur@cdot.in>, linux-mips@linux-mips.org
Message-ID: <20161101190448.MPGRYJAfXAq5CjRXpaQK51U4g0C3e2KoZMyt7jg2TIw@z>

On Tue, 1 Nov 2016, Markus Gothe wrote:

> You should calculate your boards time drift and compensate for it.

 Well it can't help if the clock rate changes spontaneously, can it?

  Maciej
