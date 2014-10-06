Received: from mail-bn1bon0088.outbound.protection.outlook.com ([157.56.111.88]:56288
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010553AbaJFXtINcAKH (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 7 Oct 2014 01:49:08 +0200
Message-ID: <54332A64.5020605@caviumnetworks.com>
Date: Mon, 6 Oct 2014 16:48:52 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
References: <1412627010-4311-1-git-send-email-ddaney.cavm@gmail.com> <20141006205459.GZ23797@brightrain.aerifal.cx> <5433071B.4050606@caviumnetworks.com> <20141006213101.GA23797@brightrain.aerifal.cx> <54330D79.80102@caviumnetworks.com> <20141006215813.GB23797@brightrain.aerifal.cx> <543327E7.4020608@amacapital.net>
In-Reply-To: <543327E7.4020608@amacapital.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Rich Felker <dalias@libc.org>, David Daney <ddaney.cavm@gmail.com>, libc-alpha@sourceware.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141006234852.3ygdlIgLcsGCmZh5jE95VALeaGUVeYwa1QRnQQ30Pn0@z>

On 10/06/2014 04:38 PM, Andy Lutomirski wrote:
> On 10/06/2014 02:58 PM, Rich Felker wrote:
>> On Mon, Oct 06, 2014 at 02:45:29PM -0700, David Daney wrote:
[...]
>> This is a huge ill-designed mess.
>
> Amen.
>
> Can the kernel not just emulate the instructions directly?

In theory it could, but since there can be implementation defined 
instructions, there is no way to achieve full instruction set coverage 
for all possible machines.

>  Can it single-step through them in place?

No.  If it could, we wouldn't be having this informative discussion.
