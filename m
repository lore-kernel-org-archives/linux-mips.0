Received: from mms1.broadcom.com ([216.31.210.17]:2184 "EHLO mms1.broadcom.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817537Ab3HZCrRx02I1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Aug 2013 04:47:17 +0200
From: "Sherman Yin" <syin@broadcom.com>
Subject: RE: [PATCH v2] pinctrl: Pass all configs to driver on
 pin_config_set()
Date: Mon, 26 Aug 2013 02:46:56 +0000
Message-ID: <051069C10411E24D9749790C498526FA1BDDCD3B@SJEXCHMB12.corp.ad.broadcom.com>
References: <1376606573-15093-1-git-send-email-syin@broadcom.com>
 <1377134300-25480-1-git-send-email-syin@broadcom.com>
 <CACRpkdZeET601+jOsjQxu-VAhi1owgtMX60Fij=uU489eGVFXg@mail.gmail.com>
In-Reply-To: <CACRpkdZeET601+jOsjQxu-VAhi1owgtMX60Fij=uU489eGVFXg@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-Path: <syin@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Matt Porter <matt.porter@linaro.org>, "Stephen Warren (swarren@wwwdotorg.org)" <swarren@wwwdotorg.org>
Message-ID: <20130826024656.jN-Cu9-1LTkApo6XeoE6tX_LsOwTj9WyULBaRdx6qwA@z>

Hi Linus,

>Didn't you get review from Stephen Warren?

Yes, just wasn't sure when those tags should be added.  They have been 
added to v3 now.

>Please try to put all the maintainers for the above files on the To: line
>so they get a chance to review/ack the patch.

Ok.  I've added the emails from get_maintainer.pl for each of the files.
v3 has been rebased today and I also applied the API changes to 
pinctrl-palmas.c

Regards,
Sherman
