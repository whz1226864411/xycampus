/**
 * Created by Administrator on 2016/8/11.
 */
function sportFrame(obj,prop,end)
{
    clearInterval(obj.timer);

    var speed=0;
    var val=0;

    obj.timer=setInterval(function(){

        if(prop=='opacity')
        {
            val=Math.round(cssStyle(obj,prop)*100);
        }
        else
        {
            val=parseInt(cssStyle(obj,prop));

        }

        speed=(end-val)/10;
        speed=speed>0?Math.ceil(speed):Math.floor(speed);

        if(end==val)
        {
            clearInterval(obj.timer);
        }
        else
        {
            if(prop=='opacity')
            {
                obj.style.opacity=(val+speed)/100;
                obj.style.filter='alpha(opacity:'+(val+speed)+')';  //IE�����

            }else
            {
                cssStyle(obj,prop,(val+speed));
            }
        }


    },30);



}

function cssStyle(obj,prop,value) {
    //��������������ʱ��Ĺ����ǻ�ȡ�ö��������ֵ
    //��������������ʱ��Ĺ��������øö�������Ե�ֵ
    //arguments ���Ǳ��洫�ݲ���������
    if (arguments.length == 2) {
        if (obj.currentStyle) {
            return obj.currentStyle[prop];  // IE �������ʹ��
        }
        else {
            return getComputedStyle(obj, false)[prop];  //FF  chrome �߰汾�������
        }
    }
    else if (arguments.length == 3) {
        obj.style[prop] = value + 'px';
    }
    else {

    }
}