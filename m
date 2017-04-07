Received: from mailapp01.imgtec.com ([195.59.15.196]:59023 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990557AbdDGLcpFimTW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Apr 2017 13:32:45 +0200
Subject: Re: [PATCH] MIPS: Use common outgoing-CPU-notification code
References: <1491559974-20197-1-git-send-email-marcin.nowakowski@imgtec.com>
 <57852660-ca40-0fb5-14b9-5e9e69cde907@cogentembedded.com>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <09d0ef07-c66b-1cbd-4895-0f8ac03352a7@imgtec.com>
Date: Fri, 7 Apr 2017 13:32:38 +0200
MIME-Version: 1.0
In-Reply-To: <57852660-ca40-0fb5-14b9-5e9e69cde907@cogentembedded.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20170407113238.r8rQlC_XlNyzV9VFIcASbc-3X_pN6-6Zr01_1U58SCg@z>

Hi,

On 07.04.2017 13:04, Sergei Shtylyov wrote:
> Hello!
>
> On 4/7/2017 1:12 PM, Marcin Nowakowski wrote:
>
>> This commit removes the open-coded CPU-offline notification with new
>
>    Replaces, perhaps?
>

Yeah, that will be better. I'll send an updated version.

thanks
Marcin
