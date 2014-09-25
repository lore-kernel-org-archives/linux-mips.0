Received: from mailapp01.imgtec.com ([195.59.15.196]:40402 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009738AbaIYKYxGLjhS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 25 Sep 2014 12:24:53 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A167789CB82BE
        for <linux-mips@linux-mips.org>; Thu, 25 Sep 2014 11:24:43 +0100 (IST)
Message-ID: <5423ED6D.903@imgtec.com>
Date: Thu, 25 Sep 2014 11:24:45 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] MIPS: wrap cfcmsa & ctcmsa accesses for toolchains
 with MSA support
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com> <1411551942-11153-5-git-send-email-paul.burton@imgtec.com> <5422B434.2020405@imgtec.com> <20140925092350.GV17248@pburton-laptop>
In-Reply-To: <20140925092350.GV17248@pburton-laptop>
Content-Type: text/plain; charset="UTF-8"
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20140925102445.DF0crN1OHZXkkgFF40VdUVBnn8B7Lgl97uXX3WjckYA@z>

On 25/09/14 10:23, Paul Burton wrote:
> On Wed, Sep 24, 2014 at 01:08:20PM +0100, James Hogan wrote:
>> On 24/09/14 10:45, Paul Burton wrote:
>>> and provide
>>> implementations for the TOOLCHAIN_SUPPORTS_MSA case which ".set msa" as
>>> appropriate.
>>
>> nit: which *uses* ".set msa"?
>>
>> Cheers
>> James
> 
> In my head I read that without the ".", so "which set msa" seems quite
> natural to me. But if you/others are bothered enough let me know, I
> don't mind adding "uses".

Meh, fair enough, I'm reading it like that too now :)

Cheers
James
