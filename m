Received: from mailapp01.imgtec.com ([195.59.15.196]:56996 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009593AbaIXMI23cuBk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Sep 2014 14:08:28 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9DABF3E5F269
        for <linux-mips@linux-mips.org>; Wed, 24 Sep 2014 13:08:18 +0100 (IST)
Message-ID: <5422B434.2020405@imgtec.com>
Date: Wed, 24 Sep 2014 13:08:20 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] MIPS: wrap cfcmsa & ctcmsa accesses for toolchains
 with MSA support
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com> <1411551942-11153-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1411551942-11153-5-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20140924120820.Gj56QHZ4UEtZPa0SmoEvgIWdbh0qVphUG4V9ppczNIE@z>

On 24/09/14 10:45, Paul Burton wrote:
> and provide
> implementations for the TOOLCHAIN_SUPPORTS_MSA case which ".set msa" as
> appropriate.

nit: which *uses* ".set msa"?

Cheers
James
