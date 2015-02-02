Received: from mailapp01.imgtec.com ([195.59.15.196]:52525 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012150AbbBBPTeExwbO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 2 Feb 2015 16:19:34 +0100
Message-ID: <54CF9577.6040004@imgtec.com>
Date: Mon, 2 Feb 2015 09:19:19 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: Few questions about porting Linux to SMP86xx boards
References: <54CEACC1.1040701@gmail.com>
In-Reply-To: <54CEACC1.1040701@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Oleg Kolosov <bazurbat@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20150202151919.dbZjr0Pf4FXfNQx6fFd6DpVoFeUWbPJU3fsRbLwEAWE@z>

On 02/01/2015 04:46 PM, Oleg Kolosov wrote:
> Hello MIPS gurus!
> 
Hello.

> I'm adding support for Sigma Designs SMP8652/SMP8654 (Tango3 family,
> MIPS 24kf CPU) to newer kernel. I've selectively adapted patches from
> 2.6.32.15 (the latest officially available for us) to the latest mips
> 3.18 stable branch and things seem to work (it boots, runs simple test
> programs), but there are few questions which I was not able to resolve
> yet with my limited experience:
> 
It is good to hear somebody is working with that hardware. I have
uploaded all the Sigma source that we were given along with their root
file system images. A lot is for the 8910, but there is stuff in there
for the 86xx family as well.

Steve


http://www.linux-mips.org/pub/linux/mips/people/sjhill/Sigma/
