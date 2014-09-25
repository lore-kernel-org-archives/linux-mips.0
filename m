Received: from mailapp01.imgtec.com ([195.59.15.196]:63669 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009050AbaIYJYBje1Ro (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 25 Sep 2014 11:24:01 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DB99E7954D9FD
        for <linux-mips@linux-mips.org>; Thu, 25 Sep 2014 10:23:52 +0100 (IST)
Date: Thu, 25 Sep 2014 10:23:50 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 04/11] MIPS: wrap cfcmsa & ctcmsa accesses for toolchains
 with MSA support
Message-ID: <20140925092350.GV17248@pburton-laptop>
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
 <1411551942-11153-5-git-send-email-paul.burton@imgtec.com>
 <5422B434.2020405@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5422B434.2020405@imgtec.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20140925092350.7mzutVDG8b4TcEZrHa3sVJF3vbf7Yrk0mJJMwiqBEPA@z>

On Wed, Sep 24, 2014 at 01:08:20PM +0100, James Hogan wrote:
> On 24/09/14 10:45, Paul Burton wrote:
> > and provide
> > implementations for the TOOLCHAIN_SUPPORTS_MSA case which ".set msa" as
> > appropriate.
> 
> nit: which *uses* ".set msa"?
> 
> Cheers
> James

In my head I read that without the ".", so "which set msa" seems quite
natural to me. But if you/others are bothered enough let me know, I
don't mind adding "uses".

Paul
