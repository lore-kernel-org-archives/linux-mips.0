Received: from mailapp01.imgtec.com ([195.59.15.196]:51547 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026562AbcDNP3d7TD3N (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 Apr 2016 17:29:33 +0200
Subject: Re: New MIPS SoC code insertion request
References: <E6691421972ADD4588ABC5DDDF6E279B8734754A@NRMAIL.baikal.int>
 <E6691421972ADD4588ABC5DDDF6E279B87347565@NRMAIL.baikal.int>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <570FB753.3060001@imgtec.com>
Date: Thu, 14 Apr 2016 16:29:23 +0100
MIME-Version: 1.0
In-Reply-To: <E6691421972ADD4588ABC5DDDF6E279B87347565@NRMAIL.baikal.int>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Dmitry.Dunaev@baikalelectronics.ru, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Cc: Constantine.Gurin@baikalelectronics.ru, Alexey.Malahov@baikalelectronics.ru
Message-ID: <20160414152923.g1wE7PeglNffA9DYFiEqdr5sr5UJcp9fAJyFOtbc858@z>

Hi Dmitry,

Thank-you very much for reaching out to the mailing list.

The Linux kernel follows a structure for patch submissions.

There’s a tutorial on github with a pdf and readmes.

https://github.com/gregkh/kernel-tutorial

Tutorial Videos on YouTube by GregKH are also very useful.

https://www.youtube.com/watch?v=LLBrBBImJt4

https://www.youtube.com/watch?v=XXix80GCvpo

These will give an overview of the entire process.

It would be nice if you could push your current working kernel
somewhere on a git server where we could see the patches
and then provide guidance accordingly.

If you don't have a public-facing git server. You could just
push the code to a repository on github and share the link.

Regards,
ZubairLK

On 14/04/16 15:43, Dmitry.Dunaev@baikalelectronics.ru wrote:
> Good day!
>
> I'm Dmitry Dunaev, software designer from Baikal Electronics - Russian semiconductor company (http://www.baikalelectronics.com/). Some time ago we are released our first MIPS processor based on P5600 core (https://www.linux-mips.org/wiki/Baikal).
>
> Now we have this SoC in silicon. Also we have released several revisions of development boards for our SoC. So it seems that we ready to add our platform code into Linux kernel mainline.
>
> Could you please clarify me what steps we should to do to add our code into kernel repositary?
>
> Best regards,
> Dmitry Dunaev
> http://www.baikalelectronics.com/
>
