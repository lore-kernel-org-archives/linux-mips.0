Received: from mail.bmw-carit.de ([62.245.222.98]:50098 "EHLO
        mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008799AbcBJG2Vsmn2p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Feb 2016 07:28:21 +0100
Subject: Re: [PATCH v3 3/3] mips: Differentiate between 32 and 64 bit ELF
 header
References: <201602090033.mukhdG4N%fengguang.wu@intel.com>
 <56B99D55.2020301@bmw-carit.de>
 <alpine.DEB.2.00.1602091148570.15885@tp.orcam.me.uk>
 <56B9DDCA.3000700@bmw-carit.de>
 <alpine.DEB.2.00.1602091941400.15885@tp.orcam.me.uk>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56BAD881.9000208@bmw-carit.de>
Date: Wed, 10 Feb 2016 07:28:17 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602091941400.15885@tp.orcam.me.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <daniel.wagner@bmw-carit.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160210062817.jPG2GEa8H8rr99ebIkjkYT5_jaSBFvcsmaa6dhZ457g@z>

On 02/09/2016 08:44 PM, Maciej W. Rozycki wrote:
> On Tue, 9 Feb 2016, Daniel Wagner wrote:
> 
>>>  FWIW I think all the MIPS ABI flags stuff also needs to go outside the 
>>> conditional, because it's ABI agnostic.  I'll make the right change myself 
>>> on top of your fixes.  It'll remove a little bit of code duplication, 
>>> which is always welcome.
>>
>> Great, thanks for taking care of it.
> 
>  My ABI flags change has passed testing and I'm ready to post it, will you 
> be respinning your patch soon?

I was waiting for your cleanups and base my patches on top of it. Looks
like a small misunderstanding on my side :) I'll start on v4 right now.

cheers,
daniel
