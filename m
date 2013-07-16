Received: from multi.imgtec.com ([194.200.65.239]:53741 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827823Ab3GPTRz6UlWh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 16 Jul 2013 21:17:55 +0200
Message-ID: <51E59BFF.3030808@imgtec.com>
Date: Tue, 16 Jul 2013 14:16:15 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Complete kernel source trees for ERLite-3.
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: linux-mips@linux-mips.org
Message-ID: <20130716191615.3OBd-t_wy0yL8GLuae6OkQMOxrRkiZWP40IB_oRlQVU@z>

Hello.

If anyone is interested I have created the complete original kernel 
source trees for the v1.0.2, v1.1.0 and v1.2.0 firmware releases on the 
ERLite-3. They were made from the following components:

    COMMON
    * Cavium SDK 2.0.0 - free download from <cnusers.org>
    * git tag '2.6.32.13'

    V1.0.2
    * GPL.ERLite-3.v1.0.2.4507738.tbz2 - free download from <ubnt.com>
      * source/kernel_4503552-gcc4cdf7.tgz
      * source/cavm-executive_4493936-g009d77b.tgz

    V1.1.0
     * GPL.ER-e100.v1.1.0.4543695.tbz2 - free download from <ubnt.com>
       * source/kernel_4539683-g7b3312f.tgz
       * source/cavm-executive_4539683-g6868fcf.tgz

    V1.2.0
     * GPL.ER-e100.v1.2.0.4574253.tbz2 - free download from <ubnt.com>
       * source/kernel_4567941-g0568484.tgz
       * source/cavm-executive_4567941-gcc0028b.tgz

git repo:   git://git.linux-mips.org/pub/scm/sjhill/linux-sjhill.git
   branch:   erlite3-2.6
     tags:   erlite3-v1.0.2, erlite3-v1.1.0, erlite3-v1.2.0

I also created a 'arch/mips/configs/erlite3_defconfig' config file to 
make things easier. I can confirm that using the 'erlite3-v1.0.2' tag my 
built kernel worked perfectly with my ERLite-3, since it has not had a 
firmware upgrade yet. All the existing modules including the proprietary 
ones worked. However, do not mix kernel and firmware versions if you are 
going to build the kernel from source. Special thanks to An-Cheng Huang 
for his help and answering all my questions.

Steve
